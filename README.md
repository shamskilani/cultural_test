# Backend API Documentation

This is the documentation for the Backend API solution for the Culture Matching application. The solution is implemented using Ruby on Rails framework as an API, with PostgreSQL as the database. The API follows REST architecture principles and is documented using OpenAPI. The solution meets all the specified requirements and has been properly tested, documented, and linted.

## Getting Started

To run the Culture Matching application, follow the instructions below:

### Prerequisites

- Ruby (version 2.7 or higher)
- Ruby on Rails (version 6.0 or higher)
- PostgreSQL (version 9.6 or higher)

### Installation

1. Clone the GitHub repository for the solution:

   ```
   git clone https://github.com/shamskilani/cultural_test
   ```

2. Navigate to the project directory:

   ```
   cd culture-matching
   ```

3. Install the required dependencies using Bundler:

   ```
   bundle install
   ```

4. Set up the database by creating and migrating the schema:

   ```
   rails db:create
   rails db:migrate
   ```
### Running the Server

To start the Rails server and run the API, execute the following command:

```
rails server --binding=0.0.0.0
```

The server will start running on `http://localhost:3000`.

## API Endpoints

The API provides the following endpoints for managing the Culture Matching application:

- **Culture Types**
  - `POST /api/v1/culture_types`: Create a new culture type.
  - `GET /api/v1/culture_types`: Get all culture types.

- **Applicants**
  - `POST /api/v1/applicants`: Create a new applicant.
  - `GET /api/v1/applicants`: Get all applicants.
  - `GET /api/v1/applicants/matched`: Get applicants matching a specific culture type.

- **Companies**
  - `POST /api/v1/companies`: Create a new company.
  - `GET /api/v1/companies`: Get all companies.

For detailed information about the request and response formats for each endpoint, refer to the OpenAPI documentation provided.


## Domain Model

The application's domain model consists of the following models with their respective attributes:

- **Culture Type**
  - `id` (integer)
  - `name` (string, required)

- **Applicant**
  - `id` (integer)
  - `first_name` (string, required)
  - `last_name` (string, required)
  - `culture_type` (string, default: undefined, one of "culture_types")

- **Company**
  - `id` (integer)
  - `name` (string, required)
  - `culture_type` (string, default: undefined, one of "culture_types")

## Controllers

### ApplicantsController

Controller for managing applicants.

#### Actions

- **create**: Creates a new applicant.

  - **Parameters**:
    - `first_name` (required, String): The first name of the applicant.
    - `last_name` (required, String): The last name of the applicant.
    - `culture_type` (required, String): The culture type of the applicant.

  - **Response**:
    - If the applicant is successfully created, the JSON representation of the created applicant is returned with the status code `201 Created`.
    - If there are validation errors, the errors are returned as JSON with the status code `422 Unprocessable Entity`.

- **index**: Returns all applicants.

  - **Response**:
    - The JSON array containing all applicants is returned with the status code `200 OK`.


### CompaniesController

Controller for managing companies.

#### Actions

- **create**: Creates a new company.

  - **Parameters**:
    - `name` (required, String): The name of the company.
    - `culture_type` (optional, String): The culture type of the company.

  - **Response**:
    - If the company is successfully created, the JSON representation of the created company is returned with the status code `201 Created`.
    - If there are validation errors, the errors are returned as JSON with the status code `422 Unprocessable Entity`.

- **index**: Returns all companies.

  - **Response**:
    - The JSON array containing all companies is returned with the status code `200 OK`.


### CultureTypesController

Controller for managing culture types.

#### Actions

- **create**: Creates a new culture type.

  - **Parameters**:
    - `name` (required, String): The name of the culture type.

  - **Response**:
    - If the culture type is successfully created, the JSON representation of the created culture type is returned with the status code `201 Created`.
    - If there are validation errors, the errors are returned as JSON with the status code `422 Unprocessable Entity`.

- **index**: Returns all culture types.

  - **Response**:
    - The JSON array containing all culture types is returned with the status code `200 OK`.


## Models

### Applicant

Model representing an applicant.

#### Validations

- `first_name` (presence): Validates the presence of the first name.
- `last_name` (presence): Validates the presence of the last name.
- `culture_type` (presence): Validates the presence of the culture type.


### Company

Model representing a company.

#### Validations

- `name` (presence): Validates the presence of the name.


### CultureType

Model representing a culture type.

#### Validations

- `name` (presence): Validates the presence of the name.


This documentation provides an overview of the controllers and models, along with the actions, parameters, and responses for each controller action. It also outlines the validations applied to each model.
