State Management Approach: GetX

This combination of GetX and Hive ensures efficiency,
scalability, and a seamless developer experience for 
CRUD operations.


Workflow:
1) Model: Define JobModel for data representation.
2) Repository: Handle data persistence with Hive.
3) Controller: Use GetX to manage the state and encapsulate business logic for CRUD operations.
4) View: Observe the controller's reactive variables to update the UI in real-time.


Example:
When a job is added:
Controller calls the repository to save the data to Hive.
jobList is updated using loadJobs() after the save operation.
The UI listens to jobList changes (thanks to .obs) and 
automatically refreshes to show the updated job list.




Task Description
Create a Flutter app where users can:
1. View a list of available jobs. (done)
2. Add a new job with a title, description, and status (e.g,pending, in-progress,completed). (done)
3. Update the status of a job. (done)
4. Delete jobs. (done)

Features to Implement

1. Home Screen
○ Display a list of all jobs in a card-based UI. (done)
○ Use color-coded tags or labels to indicate job status: (done)
■ Pending: Yellow (done)
■ In-progress: Blue (done)
■ Completed: Green (done)

2. Add Job Screen (done)
○ A form to add a new job: (done)
■ Fields: Title, Description, and Status (dropdown). (done)
■ A"Save" button to create the job. (done)
○ Validate inputs (e.g., title and description must not be empty). (done)

3. Edit Job
○ Allow users to update the status of a job (via dropdown or toggle). (done)

4. Delete Job
○ Allow users to delete a job by swiping or tapping a delete icon. (done)
○ Show a confirmation dialog before deletion. (done)

5. Job Storage
○ Use either:
■ REST API (mocked with tools like jsonplaceholder.typicode.com or similar).
■ OR
■ Local database (e.g., SQLite, Hive). (yes i used hive for local database)

Technical Requirements

1. Architecture:
○ Follow MVVM architecture strictly: (done)
■ Model: Define job data structures. (done)
viewModel: Handle business logic and state management. (done)
■ View: Build the UI and observe ViewModel changes. (yes i used obx)

2. State Management:
○ Use any state management library (e.g., Provider, Riverpod, GetX, Bloc, etc.). (yes i used getx)

3. UI/UX:
○ Responsive and professional Material Design UI. (for pexels wise i used screen utils package)
○ A clean, modern interface with proper spacing and alignment. (done)

4. Data Persistence:
○ Mock API or local database for CRUD operations. ( yes i used local database for CRUDS operation)

Bonus Points
1. Add sorting options to the job list (e.g., sort by status or creation date). (done)
2. Implement a search bar to filter jobs by title or description. (Implemented)
3. Add pagination or lazy loading if data comes from an API. (i used local database here)

Constraints
● Ensure compatibility with both Android and iOS. (yes i checked twice on ios simulator and android physical device)

 thank you for your time!