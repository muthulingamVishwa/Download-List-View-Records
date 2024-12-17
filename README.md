# Download-List-View-Records

🌟 Salesforce ListView Page: Add Button for CSV Exports 🌟
I'm excited to share a custom solution I developed that allows users to export up to 50,000 records from Salesforce 
ListViews to CSV—bypassing the standard 2,000-record limit! 🚀
 This is a game-changer for anyone working with large datasets in Salesforce.
 
🔑 Key Features:
     ✅ Dynamic ListView Support
     Integrates seamlessly with both standard and custom objects by dynamically pulling ListView metadata.
     ✅ Clean CSV Output
     Excludes unnecessary system fields (like Id and SystemModstamp) for cleaner, more usable CSV files.
     ✅ Optimized Queries
     Uses the REST API for fast, efficient data handling, even with large datasets.
     ✅ Secure & Scalable
     Built using Salesforce best practices to ensure performance and scalability.

⚙️ How It Works:
    
    1️⃣ Fetch the ListView ID
        The solution dynamically retrieves the ListView ID using getFilterId() in a Visualforce page.
        Example setup:
        •  standardController="Employee__c": Leverages Salesforce’s built-in controller for Employee__c records.
        •  recordSetVar="Employee__c": Defines the variable for the list of Employee__c records.
        •  window.onload: Executes the script when the page fully loads.
        •  window.open('/apex/download?listViewId={!listviewId}'): Opens a new tab with a dynamic download link.
        •  window.history.back(): Redirects the user back to the previous page after initiating the download.

2️⃣ SOQL Query Optimization
Dynamically queries records based on ListView filters, ensuring accurate and fast data retrieval.

3️⃣ REST API Flexibility
Uses the REST API to fetch ListView details and records:
Describe the ListView:
GET /services/data/v57.0/sobjects/{objectApiName}/listviews/{listViewId}/describe

Query Rows Efficiently:
Handles up to 50,000 records with optimized API logic.

4️⃣ Efficient Record Processing
To avoid hitting CPU time limits, processing is delegated to an external script for large datasets.

5️⃣ Generate the CSV
The external script processes fetched records and generates a user-friendly CSV file, ready for download.
🚀 Why This Matters:
This solution eliminates the data export limitations in Salesforce and simplifies handling large datasets. Ideal for businesses working with extensive Salesforce data! 📊
Feel free to reach out with questions or for a deeper dive—I’d love to connect! 🤝
