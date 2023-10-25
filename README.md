# ESRA - Emergency Services Response Application
The Emergency Services Response Application (ESRA) is a tool designed to streamline and optimize the coordination of emergency response teams. This software enables dispatchers and first responders to efficiently manage and respond to emergency situations, such as medical crises, fires, natural disasters, and law enforcement incidents.

### Main Goals
- Facilitate efficient emergency response
- real-time incident management
- resource optimization
- user-friendly interface
### Secondary Goals
- Include data integration
- support for multiple agencies
- mobile accessibility
- incident history and reporting
- scalability
- reliability
- Ensure security and data privacy

### User Stories
1. There is a fire on High and North Broadway, and I need to dispatch the closest fire station crew to the scene and notify the caller of the approximate time of arrival of the fire station crew in Columbus, Ohio.

2. There is a reported robbery on High and 1st, and I need to dispatch a police officer to the scene and notify the caller of the approximate time of arrival for the police officer in Columbus, Ohio.

3. If any emergency situation has a medical emergency present, dispatch paramedics, then return to the hospital if a patient is present.

### Flow
- Dispatcher can see a map of available emergency stations, responders, hospitals, and street layout.
- Dispatcher receives emergency services response requests via text and on the map.
- Response includes:
  - Location
  - Type of service needed
- Dispatcher selects and dispatches responders to respond.
- Responders automatically navigate to the response location, then return to the base, and return patients to the hospital.

### Data Structures - PLEASE REFERENCE create_esra_db.sql
#### Database Schema/Data Models
- Fire Stations (name, lat, long, address, num of responders)
- Police Stations (name, lat, long, address, num of responders)
- Hospitals (name, lat, long, address, num of responders, num of patients)
- Emergency Request (lat, long, address, type, requires medical?)
- Responders (name, type)

### Application Structure
- Main Entry Point
- Display Map and Command UI
- Display Emergency Response Request
- Select Commands in Command UI
- Display Response Tracking Information Window
- Display Response Complete Information Window

### Functions
- Display Map
- Display Command UI
- Display Response Request
- Display Response Tracking
- Display Response Complete

### Input/Output (IO)
- Input: Dispatcher commands
- Output: Error handling to disallow incorrect user inputs

### Testing
- Unit
- Integration

### Dependencies
- Use Google Maps API
- Database of fire station locations and streets, intersections, city addresses

### Environment
- Back End: C#/.NET
- Front End: JavaScript
- Web App: ASP.NET

### Deployment
- Web

### Documentation
- Document the application's architecture, codebase, APIs, and user manuals for dispatchers.
