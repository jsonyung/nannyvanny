# Nanny Vanny - Nanny Booking App

Welcome to Nanny Vanny, a Flutter mobile application designed for booking nanny services. This app provides a seamless experience for users to find and book nannies through a user-friendly interface.

## Table of Contents

- [Overview](#overview)
- [User Interface](#user-interface)
- [API Integration](#api-integration)
- [BLoC Pattern](#bloc-pattern)
- [Code Structure and Organization](#code-structure-and-organization)
- [Documentation](#documentation)
- [Screenshots](#screenshots)
- [Submission](#submission)

## Overview

The Nanny Vanny app is a Flutter-based mobile application that allows users to book nanny services. It includes essential features such as user authentication, booking management, and profile management.

## User Interface

The app comprises multiple screens, each serving a specific purpose:

1. **Sign In Page:**
    - Allows users to sign in to their accounts.

2. **Sign Up Page:**
    - Enables users to create a new account.

3. **Main Page:**
    - Contains four sections:
        - **Home:** Displays available services and relevant information.
        - **Packages:** Lists different service packages available for booking.
        - **Bookings:** Allows users to manage their bookings.
        - **Profile:** Lets users view and edit their profile information.

## API Integration

The app integrates with external APIs for functionalities such as:

- User authentication.
- Fetching service packages and booking details.

## BLoC Pattern

The app uses the BLoC (Business Logic Component) pattern for state management:

- **MainPageBloc:** Manages the state of the Main Page.
- **BookingsBloc:** Handles the state related to bookings.
- **PackagesBloc:** Manages the state of service packages.
- **SignupFormBloc:** Manages the state related to user sign-up forms.
- **DropdownBloc:** Handles the state for dropdown menus.

## Code Structure and Organization

The codebase follows a clean and maintainable architecture:
- Utilizes the BLoC pattern for effective state management.
- Organizes code logically for readability and maintainability.

## Documentation

For detailed API documentation, visit the [Documentation](http://htmlpreview.github.io/?https://github.com/jsonyung/nannyvanny/blob/master/doc/api/index.html).

## Screenshots

<img src="/screenshots/sign_in.jpg" alt="Sign In Page" width="200"/>
<img src="/screenshots/sign_up.jpg" alt="Sign Up Page" width="200"/>
<img src="/screenshots/home.jpg" alt="Home Page" width="200"/>
<img src="/screenshots/packages.jpg" alt="Packages Page" width="200"/>
<img src="/screenshots/bookings.jpg" alt="Bookings Page" width="200"/>
<img src="/screenshots/profile.jpg" alt="Profile Page" width="200"/>

## Submission

To run the app locally, follow these instructions:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/nanny_vanny.git
