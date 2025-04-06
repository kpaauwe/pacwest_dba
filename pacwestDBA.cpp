/*
CSCI 370 - Project
Kieran Paauwe, 665186888
April 5, 2025

@Brief
*This is a database program that connects to the viu oracle database server.
*It prompts the user for username and password and then sets up the connection
*This program requires account number and year to be passed through as aruments on calling the program.
*These parameters are used to generate a report about that member's activity in the year they specify
*If the account number also matches a producer then a producer supplyrecords section is appended to the report.
*Connection is terminated after all is completed or if an error occurs
*/

#include <iostream>
#include <cstdlib>
#include <string>
#include <stdio.h>
#include <fstream>
#include <iomanip>
#include <algorithm>
#include <limits>
#include <occi.h>
#include <termios.h>
#include <unistd.h>

using namespace std;
using namespace oracle::occi;

/*
This function sanitizes user input to allow it to be entered into sql queries

*/
string sanitize(string s)
{
    string ns = "";
    for(int i = 0; i < s.length(); i++) {
        if (s[i] == '\'' || s[i] == '\\' || s[i] == ';')
        ns = ns + '\\';
        ns = ns + s[i];
    }
    return ns;
}


/*
This function reads the password from the user without showing it on the screen
*/
string readPassword()
{
    struct termios settings;
    tcgetattr( STDIN_FILENO, &settings );
    settings.c_lflag =  (settings.c_lflag & ~(ECHO));
    tcsetattr( STDIN_FILENO, TCSANOW, &settings );
    
    string password = "";
    getline(cin, password);
    
    settings.c_lflag = (settings.c_lflag |   ECHO );
    tcsetattr( STDIN_FILENO, TCSANOW, &settings );
    return password;
}

/*
@Brief  This function prints out the beginner interface to explain how to use this DBA
*/
void introPrompt() {
    cout << "Welcome to the PacWest Database Management System!" << endl;
    cout << "=================================================" << endl << endl;
    cout << "This program can be used to lookup, change, add, or remove information about:" << endl;
    cout << "- Athletes\n- Teams\n- Sports\n- Schools\n" << endl;
    cout << "Press Enter to continue...\n";
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
}


/*
@Brief  This function is used when a more broad query is desired, it can list all tuples in a table or do a basic query with simple conditions
        This function keeps track of how many headers the user requested and adjusts the cout table size accordingly

*/
void listAll(Statement* stmt, const string& category, const string& headers, const string& condition = "noCond") {
    try {
        string query = "SELECT " + headers + " FROM " + category;
        if (condition != "noCond") {
            query += " WHERE " + condition;
        }
        stmt->setSQL(query);
        
        ResultSet* rs = stmt->executeQuery();
        
        int columnCount = 1;
        for(int i=0; i < headers.length(); i++) {
            if(headers[i] == ',') columnCount++; //separate headers from comma list
        }
        
        while (rs->next()) {
            for(int i = 1; i <= columnCount; i++) {
                if(i > 1) cout << " | ";
                cout << rs->getString(i);
            }
            cout << endl;
        }
        stmt->closeResultSet(rs);        
    } catch (SQLException& e) {
        cout << "Database error: " << e.getMessage() << endl;
    }
}


/*
@Brief  This function handles all the specific predefined query requests
        Takes in a string, queryType, and matches it to a preset query, first asking the user for extra details if the query requires it.
        The function then cleans up the output and presents it as a table for the user to view, with headers at the top and tuples underneath
*/
void executeQuery(Statement* stmt, const string& queryType) {
    try {
        string query;
        
        if (queryType == "tallest") {
            query = "SELECT * FROM ("
            "SELECT a.athName, a.height, s.schoolName "
            "FROM Athletes a "
            "JOIN Teams t ON a.teamID = t.teamID "
            "JOIN Schools s ON t.schoolID = s.schoolID "
            "ORDER BY a.height DESC"
            ") WHERE ROWNUM <= 5";
        } 
        else if (queryType == "shortest") {
            query = "SELECT * FROM ("
            "SELECT a.athName, a.height, s.schoolName "
            "FROM Athletes a "
            "JOIN Teams t ON a.teamID = t.teamID "
            "JOIN Schools s ON t.schoolID = s.schoolID "
            "ORDER BY a.height ASC"
            ") WHERE ROWNUM <= 5";
        }
        else if (queryType == "bestRecord") {
            query = "SELECT * FROM ("
            "SELECT t.teamID, s.schoolName, sp.sportName, t.seasonRec FROM Teams t "
            "JOIN Schools s ON t.schoolID = s.schoolID "
            "JOIN Sports sp ON t.sportID = sp.sportID "
            "ORDER BY TO_NUMBER(SUBSTR(t.seasonRec, 1, INSTR(t.seasonRec, '-')-1)) DESC"
            ") WHERE ROWNUM <= 5";
        }
        else if (queryType == "homeTown") {
            string homeTown;
            cout << "Enter city name (e.g., Calgary) or province code (e.g., BC): ";
            cin >> homeTown;
            homeTown = sanitize(homeTown);
            query = "SELECT athName, hometown, teamID FROM Athletes WHERE hometown LIKE '%" + homeTown + "%'";
        }
        else if (queryType == "sameJersey") {
            string jerseyNum;
            cout << "Enter jersey number: ";
            cin >> jerseyNum;
            jerseyNum = sanitize(jerseyNum);
            
            query = "SELECT a.jerseyNum, a.athName, s.schoolName, sp.sportName "
                    "FROM Athletes a "
                    "JOIN Teams t ON a.teamID = t.teamID "
                    "JOIN Schools s ON t.schoolID = s.schoolID "
                    "JOIN Sports sp ON t.sportID = sp.sportID "
                    "WHERE a.jerseyNum = " + jerseyNum + " "
                    "ORDER BY s.schoolName, sp.sportName";

        }
        else if (queryType == "samePosition") {
            string position;
            cout << "Enter position: ";
            cin >> position;
            position = sanitize(position);
            query = "SELECT athName, position, teamID FROM Athletes WHERE position = '" + position + "'";
        }
        else if (queryType == "headCoach") {
            string school;
            cout << "Enter school ID: ";
            cin >> school;
            school = sanitize(school);
            query = "SELECT t.teamID, s.sportName, t.headCoach FROM Teams t "
            "JOIN Sports s ON t.sportID = s.sportID "
            "WHERE t.schoolID = '" + school + "'";
        }
        
        stmt->setSQL(query);
        ResultSet* rs = stmt->executeQuery();
        
        if (queryType == "tallest" || queryType == "shortest") {
            cout << left << setw(30) << "Name" << setw(10) << "Height" << "School" << endl;
            cout << string(60, '-') << endl;
        }
        else if (queryType == "bestRecord") {
            cout << left << setw(10) << "Team ID" << setw(30) << "School" << setw(20) << "Sport" << "Record" << endl;
            cout << string(70, '-') << endl;
        }
        else if (queryType == "homeTown") {
            cout << left << setw(30) << "Name" << setw(30) << "Hometown" << "Team" << endl;
            cout << string(70, '-') << endl;
        }
        else if (queryType == "sameJersey") {
            cout << left << setw(10) << "Jersey #" << setw(30) << "Athlete Name" 
            << setw(30) << "School" << "Sport" << endl;
       cout << string(90, '-') << endl;
        }
        else if (queryType == "samePosition") {
            cout << left << setw(30) << "Name" << setw(20) << "Position" << "Team" << endl;
            cout << string(60, '-') << endl;
        }
        else if (queryType == "headCoach") {
            cout << left << setw(10) << "Team ID" << setw(20) << "Sport" << "Head Coach" << endl;
            cout << string(60, '-') << endl;
        }
        
        while (rs->next()) {
            if (queryType == "tallest" || queryType == "shortest") {
                cout << left << setw(30) << rs->getString(1) << setw(10) << rs->getString(2) << rs->getString(3) << endl;
            }
            else if (queryType == "bestRecord") {
                cout << left << setw(10) << rs->getString(1) << setw(30) << rs->getString(2) 
                << setw(20) << rs->getString(3) << rs->getString(4) << endl;
            }
            else if (queryType == "homeTown") {
                cout << left << setw(30) << rs->getString(1) << setw(30) << rs->getString(2) << rs->getString(3) << endl;
            }
            else if (queryType == "sameJersey") {
                cout << left << setw(10) << rs->getString(1) << setw(30) << rs->getString(2) 
                << setw(30) << rs->getString(3) << rs->getString(4) << endl;
            }
            else if (queryType == "samePosition") {
                cout << left << setw(30) << rs->getString(1) << setw(20) << rs->getString(2) << rs->getString(3) << endl;
            }
            else if (queryType == "headCoach") {
                cout << left << setw(10) << rs->getString(1) << setw(20) << rs->getString(2) << rs->getString(3) << endl;
            }
        }
        
        stmt->closeResultSet(rs);
    } catch (SQLException& e) {
        cout << "Database error: " << e.getMessage() << endl;
    }
}


/*
@Brief  This function updates any non-key information about an athlete and lets user now its success status
*/
void updateAthlete(Statement* stmt, Connection* conn) {
    try {
        string athleteNum, field, value;
        
        cout << "Enter athlete number to update: ";
        cin >> athleteNum;
        athleteNum = sanitize(athleteNum);
        
        cout << "Enter field to update (athName, jerseyNum, position, schoolYear, height, hometown): ";
        cin >> field;
        field = sanitize(field);
        
        cout << "Enter new value: ";
        cin.ignore();
        getline(cin, value);
        value = sanitize(value);
        
        string query = "UPDATE Athletes SET " + field + " = '" + value + "' WHERE athleteNum = '" + athleteNum + "'";
        stmt->setSQL(query);
        int rowsAffected = stmt->executeUpdate();
        
        if (rowsAffected > 0) {
            cout << "Athlete updated successfully!" << endl;
        } else {
            cout << "No athlete found with that number." << endl;
        }
        
        conn->commit();
    } catch (SQLException& e) {
        cout << "Database error: " << e.getMessage() << endl;
    }
}


/*
@Brief  This function adds an athlete to the Athletes table after aqcuiring all the information for the headers
*/
void addAthlete(Statement* stmt, Connection* conn) {
    try {
        string athleteNum, athName, jerseyNum, teamID, position, year, height, hometown;
        
        cout << "Enter athlete number: ";
        cin >> athleteNum;
        
        cout << "Enter name: ";
        cin.ignore();
        getline(cin, athName);
        
        cout << "Enter jersey number: ";
        cin >> jerseyNum;
        
        cout << "Enter team ID: ";
        cin >> teamID;
        
        cout << "Enter position: ";
        cin >> position;
        
        cout << "Enter year: ";
        cin >> year;
        
        cout << "Enter height (format: 6.02): ";
        cin >> height;
        
        cout << "Enter hometown: ";
        cin.ignore();
        getline(cin, hometown);
        
        athleteNum = sanitize(athleteNum);
        athName = sanitize(athName);
        jerseyNum = sanitize(jerseyNum);
        teamID = sanitize(teamID);
        position = sanitize(position);
        year = sanitize(year);
        height = sanitize(height);
        hometown = sanitize(hometown);
        
        string query = "INSERT INTO Athletes (athleteNum, athName, jerseyNum, teamID, position, schoolYear, height, hometown) "
        "VALUES ('" + athleteNum + "', '" + athName + "', " + jerseyNum + ", '" + teamID + "', '" 
        + position + "', " + year + ", " + height + ", '" + hometown + "')";
        
        stmt->setSQL(query);
        stmt->executeUpdate();
        
        conn->commit();
        cout << "Athlete added successfully!" << endl;
    } catch (SQLException& e) {
        cout << "Database error: " << e.getMessage() << endl;
        conn->rollback();
    }
}


/*
@Brief  This function removes an athlete from the Athletes table after confirming that they are currently in it already
*/
void deleteAthlete(Statement* stmt, Connection* conn) {
    try {
        string athleteNum;
        
        cout << "Enter athlete number to delete: ";
        cin >> athleteNum;
        athleteNum = sanitize(athleteNum);
        
        // First verify the athlete exists
        string checkQuery = "SELECT athName FROM Athletes WHERE athleteNum = '" + athleteNum + "'";
        stmt->setSQL(checkQuery);
        ResultSet* rs = stmt->executeQuery();
        
        if (rs->next()) {
            string name = rs->getString(1);
            cout << "Are you sure you want to delete " << name << "? (y/n): ";
            string confirm;
            cin >> confirm;
            
            if (confirm == "y" || confirm == "Y") {
                string deleteQuery = "DELETE FROM Athletes WHERE athleteNum = '" + athleteNum + "'";
                stmt->setSQL(deleteQuery);
                stmt->executeUpdate();
                conn->commit();
                cout << "Athlete deleted successfully!" << endl;
            } else {
                cout << "Deletion cancelled." << endl;
            }
        } else {
            cout << "No athlete found with that number." << endl;
        }
        
        stmt->closeResultSet(rs);
    } catch (SQLException& e) {
        cout << "Database error: " << e.getMessage() << endl;
        conn->rollback();
    }
}


/*
This function terminates the connection to the database
*/
void endConnection(Environment* env, Connection* conn, Statement* stmt) {
    conn->terminateStatement(stmt);
    env->terminateConnection(conn);
    Environment::terminateEnvironment(env);
}

/*
The main function:
-prompts user for username and password
-sets up the database connection
-It then continues to handle all the routing between functions based on what the user would like to do
-provides a clean and easy to understanding text interface
-terminates the DB connection once quit is requested
*/
int main() {
    string userName;
    string password;
    const string connectString = "database.csci.viu.ca";
    
    
    cout << "Your user name: ";
    getline(cin, userName);
    
    cout << "Your password: ";
    password = readPassword();
    cout << endl;
    
    try {
        Environment *env = Environment::createEnvironment();
        Connection *conn = env->createConnection(userName, password, connectString);
        Statement* stmt = conn->createStatement();
        
        introPrompt();
        
        string choice;
        while(choice != "Quit") { //Options and functions router
            cout << "\n=== PacWest Database Management System ===" << endl;
            cout << "1. Browse Tables" << endl;
            cout << "2. Run DBA Queries" << endl;
            cout << "3. Modify Data" << endl;
            cout << "4. Quit" << endl;
            cout << "Enter your choice (1-4): ";
            cin >> choice;
            
            if (choice == "1") { // Browse Tables menu
                string tableName;
                cout << "\nSelect a table to browse:" << endl;
                cout << "1. Athletes" << endl;
                cout << "2. Teams" << endl;
                cout << "3. Sports" << endl;
                cout << "4. Schools" << endl;
                cout << "Enter your choice (1-4): ";
                cin >> tableName;
                
                string headerName, condition = "noCond";
                
                //Handle whatever request the user made

                if (tableName == "1") {
                    tableName = "Athletes";
                    cout << "Select columns (comma-separated, no spaces):" << endl;
                    cout << "athleteNum,athName,jerseyNum,teamID,position,schoolYear,height,hometown" << endl;
                    cin >> headerName;
                } else if (tableName == "2") {
                    tableName = "Teams";
                    cout << "Select columns (comma-separated, no spaces):" << endl;
                    cout << "teamID,schoolID,sportID,headCoach,seasonRec" << endl;
                    cin >> headerName;
                } else if (tableName == "3") {
                    tableName = "Sports";
                    cout << "Select columns (comma-separated, no spaces):" << endl;
                    cout << "sportID,sportName" << endl;
                    cin >> headerName;
                } else if (tableName == "4") {
                    tableName = "Schools";
                    cout << "Select columns (comma-separated, no spaces):" << endl;
                    cout << "schoolID,schoolName" << endl;
                    cin >> headerName;
                }
                
                //Check if user wants condition applied to their query
                cout << "Add a filter condition? (y/n): ";
                string condReq;
                cin >> condReq;
                
                if (condReq == "y" || condReq == "Y") {
                    cout << "Enter condition (e.g., teamID=001): ";
                    cin.ignore();
                    getline(cin, condition);
                    condition = sanitize(condition);
                }
                
                headerName = sanitize(headerName);
                listAll(stmt, tableName, headerName, condition);
                
            } else if (choice == "2") { //Preset queries menu
                cout << "\nSelect a query to run:" << endl;
                cout << "1. Find tallest athletes" << endl;
                cout << "2. Find shortest athletes" << endl;
                cout << "3. Find teams with best season records" << endl;
                cout << "4. Find athletes from specific hometown" << endl;
                cout << "5. Find athletes sharing same jersey number" << endl;
                cout << "6. Find athletes sharing same position" << endl;
                cout << "7. List head coaches for a school" << endl;
                cout << "Enter your choice (1-7): ";
                
                string queryChoice;
                cin >> queryChoice;
                
                //Run the desired query
                if (queryChoice == "1") executeQuery(stmt, "tallest");
                else if (queryChoice == "2") executeQuery(stmt, "shortest");
                else if (queryChoice == "3") executeQuery(stmt, "bestRecord");
                else if (queryChoice == "4") executeQuery(stmt, "homeTown");
                else if (queryChoice == "5") executeQuery(stmt, "sameJersey");
                else if (queryChoice == "6") executeQuery(stmt, "samePosition");
                else if (queryChoice == "7") executeQuery(stmt, "headCoach");
                
            } else if (choice == "3") { //Modify Data menu
                cout << "\nSelect an operation:" << endl;
                cout << "1. Update athlete information" << endl;
                cout << "2. Add new athlete" << endl;
                cout << "3. Delete athlete" << endl;
                cout << "Enter your choice (1-3): ";
                
                string opChoice;
                cin >> opChoice;
                
                if (opChoice == "1") updateAthlete(stmt, conn); //change info about athlete
                else if (opChoice == "2") addAthlete(stmt, conn); //add athlete to table
                else if (opChoice == "3") deleteAthlete(stmt, conn); //remove athlete from table
                
            } else if (choice == "4" || choice == "Quit") { //user requested to quit
                choice = "Quit";
            } else {
                cout << "Invalid choice. Please try again." << endl;
            }
        }
        //Reaches here after quit or if user did not enter a specification along the way
        cout << "Terminating Database Connection\n";
        endConnection(env, conn, stmt);
        
    } catch (SQLException & e) {
        cout << "Error: " << e.what() << endl;
        return 1;
    }
    
    return 0;
}