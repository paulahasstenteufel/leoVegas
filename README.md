# iOS Developer Assignment: Calculator

## About this project

This is a simple calculator intended to demonstrate the following:

- iOS Developent knowledge
- Swift language syntax and techniques
- Understanding of Design Patterns and Architecture
- Modularization, readability, testability and scalability
- SwiftUI experience
- Use of Apple/Swift conventions and best practices, as well as some personal preferences

## Process of development

Due to a very tight schedule I was not able to dedicate more than an hour per day, reason why I had to scatter the development over the course of several days. Total hours of coding amount to somewhere between 6-8 hours.

Please note that the commits structure are a result of this schedule as well. Under the adequate circunstances, commits should encapsulate only one specific functionality at a time and never with a broken build.

Also, for the same reason there are some unattended `TODO:`s around the code.

## Architecture and Code Organization

I chose to approach this challenge with a simple MVVM structure, which I believe does go well with SwiftUI--although I'm aware this is not an unanimous opinion on the dev community. 

I prefer to split Views as they get too complex, especially with SwiftUI's syntax, as the code can quickly feel polluted with a lot of different indentations. As the scope of the project is clear and therefore the Calculator ViewModel is not excessively complex, I opted for using extensions of it in the distributed Views, instead of creating a tiny new VM for each View.

I have made only the very necessary settings changes, so most of the new project content was kept as is.

## Tasks

I was not able to finish all the requirements, but I'll be happy to do so over the next days or on a live coding interview, whichever is preferred by the team.

I took the liberty to separate the tasks in different priority levels, so I can present a bit of my perception on this matter as well:

**Critical**:
- Add Bitcoin operation and Design
- Add tests

**High**:
- Handle calculator overflow
- Add sin/cos to ToggleManager
- Add more error handling
- Add design for error feedback
- Final architectural review and refactor 

**Medium**:
- Add app icons
- Improved Design
- Animations

**Low**:
- Clean up aspect ratio logic on KeyboardView
- Add Light/Dark mode
- Optional requirements
- Place Operation Keys back in original places after Toggling
- Persist user's last theme

## Final Thoughs and Context

I had fun playing with this assignment and felt especially happy with my solution for the Calculator logic, as I decided to challenge myself to not do any research before putting down my own ideas.

I do feel, however, that working as the only iOS Developer on my current team has made my style and practices quite stagnant, as I look back to my starting months with SwiftUI. One of the main reasons I wish for a team with iOS colleagues that are also passionate is so that I can regain the energy and creativity flow.

Thank you for taking the time to look through the assignment, I remember quite clearly that doing such reviews are somewhat draining. Please let me know if you have any questions and feel free to write comments directly in the repo if that's more comfortable.
