# Backend API Documentation

This is the documentation for the Backend API solution for the Culture Matching application. The solution is implemented using Ruby on Rails framework as an API, with PostgreSQL as the database. The API follows REST architecture principles and is documented using OpenAPI. The solution meets all the specified requirements and has been properly tested, documented, and linted.

#### Note

In the development process of the Empion Culture Matcher project, an API has been designed to facilitate the matching of applicants based on their culture type. This API eliminates the need for a separate Match model and simplifies the architecture while achieving the desired functionality.

The API is designed to accept an input parameter, culture_type, which represents the desired culture type for matching applicants. By calling this API with the appropriate culture type value, the API will query the applicants table and retrieve the matching applicants.

Here's an overview of the API design:

Endpoint: `/api/v1/applicants/matched/`
Method: GET

Request Parameters:
- culture_type: string (required) - Represents the desired culture type for matching applicants.

Response:
The API responds with a JSON array of matched applicants based on the provided culture_type.

Example Request:
```
GET /api/v1/applicants/matched/culture_type
```

Example Response:
```json
[
  {
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "culture_type": "teamwork"
  },
  {
    "id": 2,
    "first_name": "Jane",
    "last_name": "Smith",
    "culture_type": "teamwork"
  }
]
```

With this API design, by providing the desired culture type as a query parameter, the API will query the applicants table and retrieve the matching applicants. This approach effectively finds the matches without the need for a separate Match model.

Please note that this API design adheres to the principles of REST architecture and follows the general requirements specified for the Empion Culture Matcher project.


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

### Running the Tests

```
rspec sspec/
```
## Dockerization:
- I have dockerized the solution, providing a convenient way to package and deploy the application with its dependencies.
- To access the Docker image, please download it from the following link:  https://drive.google.com/file/d/17iUHa3Xe3Ne0gKC12RHSQVKwJBt4CVI_/view?usp=sharing
- Once downloaded, you can load the image using the following command:
```
docker load -i empion.tar
```
- The container can be run with the following command:
```
docker run --name empion_c -p 8080:80 -p 3000:3000 -d -t -v /usr/src/empion/cultural_test/:/app empion /bin/bash -c "/usr/src/empion/cultural_test/startup.sh"
```
- Please note that it may take approximately one minute for the container to start and run all services. Afterward, you can access the application by opening a browser and navigating to "localhost:8080".

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



# Tests
 These tests cover the various scenarios and functionalities of the Culture Matching application, including creating applicants and companies, retrieving lists of applicants and companies, matching applicants based on culture type, and managing culture types.


### ApplicantsController Tests

#### `POST #create`

- Context: with valid parameters
  - Description: Creates a new applicant with valid parameters.
  - Request Body:
    ```json
    {
      "applicant": {
        "first_name": "John",
        "last_name": "Doe",
        "culture_type": "Type A"
      }
    }
    ```
  - Test Cases:
    - It should create a new applicant:
      - Description: Verifies that a new applicant is created in the system.
      - Expected Result: The count of the `Applicant` model should increase by 1.
    - It should return HTTP status 201 (Created):
      - Description: Verifies that the response has an HTTP status of 201 (Created).
      - Expected Result: The response status should be 201.
    - It should return the created applicant as JSON:
      - Description: Verifies that the response contains the created applicant as JSON.
      - Expected Result:
        - The response content type should be 'application/json; charset=utf-8'.
        - The response body should include the applicant's details: `first_name`, `last_name`, and `culture_type`.

- Context: with invalid parameters
  - Description: Attempts to create a new applicant with invalid parameters.
  - Request Body:
    ```json
    {
      "applicant": {
        "first_name": "",
        "last_name": "Doe",
        "culture_type": "Type A"
      }
    }
    ```
  - Test Cases:
    - It should not create a new applicant:
      - Description: Verifies

 that a new applicant is not created when the parameters are invalid.
      - Expected Result: The count of the `Applicant` model should remain unchanged.
    - It should return HTTP status 422 (Unprocessable Entity):
      - Description: Verifies that the response has an HTTP status of 422 (Unprocessable Entity).
      - Expected Result: The response status should be 422.
    - It should return the errors as JSON:
      - Description: Verifies that the response contains the errors as JSON.
      - Expected Result:
        - The response content type should be 'application/json; charset=utf-8'.
        - The response body should include the validation error for the `first_name` field.

#### `GET #index`

- Description: Retrieves a list of all applicants.
- Test Case:
  - It should return all applicants:
    - Description: Verifies that all applicants are returned in the response.
    - Expected Result:
      - The response content type should be 'application/json; charset=utf-8'.
      - The response body should contain the JSON representation of all applicants.

#### `GET #matched`

- Description: Retrieves applicants with matching culture type.
- Request Parameters:
  - culture_type: The culture type to match (e.g., 'Type A').
- Test Case:
  - It should return applicants with matching culture type:
    - Description: Verifies that applicants with the specified culture type are returned in the response.
    - Expected Result:
      - The response content type should be 'application/json; charset=utf-8'.
      - The response body should contain the JSON representation of applicants whose culture type matches the requested culture type. Only the necessary attributes, such as `culture_type`, should be included in the response.

### CompaniesController Tests

#### `POST #create`

- Context: with valid parameters
  - Description: Creates a new company with valid parameters.
  - Request Body:
    ```json
    {
      "company": {
        "name": "Test Company",
        "culture_type": "Type A"
      }
    }
    ```
  - Test Cases:
    - It should create a new company:
      - Description: Verifies that a new company is created in the system.
      - Expected Result: The count of the `Company` model should increase by 1.
    - It should return the created company as JSON:
      - Description: Verifies that the response contains the created company as JSON.
      - Expected Result:
        - The response should have an HTTP status of 201 (Created).
        - The response content type should be 'application/json; charset=utf-8'.

- Context: with invalid parameters
  - Description: Attempts to create a new company with invalid parameters.
  - Request Body:
    ```json
    {
      "company": {
        "name": "",
        "culture_type": "Type A"
      }
    }
    ```
  - Test Cases:
    - It should not create a new company:
      - Description: Verifies that a new company is not created when the parameters are invalid.
      - Expected Result: The count of the `Company` model should remain unchanged.
    - It should return the errors as JSON:
      - Description: Verifies that the response contains the errors as JSON.
      - Expected Result:
        - The response should have an HTTP status of 422 (Unprocessable Entity).
        - The response content type should be 'application/json; charset=utf-8'.

#### `GET #index`

- Description: Retrieves a list of all companies.
- Test Case:
  - It should return all companies:
    - Description: Verifies that all companies are returned in the response.
    - Expected Result:
      - The response should have an HTTP status of

 200 (OK).
      - The response content type should be 'application/json; charset=utf-8'.
      - The response body should contain the JSON representation of all companies.

### CultureTypesController Tests

#### `POST #create`

- Context: with valid parameters
  - Description: Creates a new culture type with valid parameters.
  - Request Body:
    ```json
    {
      "culture_type": {
        "name": "Test Culture Type"
      }
    }
    ```
  - Test Cases:
    - It should create a new culture type:
      - Description: Verifies that a new culture type is created in the system.
      - Expected Result:
        - The response should have an HTTP status of 201 (Created).
        - The response content type should be 'application/json; charset=utf-8'.
        - The response body should contain the JSON representation of the created culture type.

- Context: with invalid parameters
  - Description: Attempts to create a new culture type with invalid parameters.
  - Request Body:
    ```json
    {
      "culture_type": {
        "name": ""
      }
    }
    ```
  - Test Cases:
    - It should not create a new culture type:
      - Description: Verifies that a new culture type is not created when the parameters are invalid.
      - Expected Result:
        - The response should have an HTTP status of 422 (Unprocessable Entity).
        - The response content type should be 'application/json; charset=utf-8'.
        - The response body should contain the validation error for the `name` field.

#### `GET #index`

- Description: Retrieves a list of all culture types.
- Test Case:
  - It should return all culture types:
    - Description: Verifies that all culture types are returned in the response.
    - Expected Result:
      - The response should have an HTTP status of 200 (OK).
      - The response content type should be 'application/json; charset=utf-8'.
      - The response body should contain the JSON representation of all culture types.

### Applicant Model Tests

#### Validations

- Description: Tests the validations of the `Applicant` model.
- Test Cases:
  - It should validate the presence of first_name:
    - Description: Verifies that an applicant is not valid without a `first_name`.
    - Expected Result:
      - The applicant should not be valid.
      - The `first_name` field should have a validation error indicating that it can't be blank.
  - It should validate the presence of last_name:
    - Description: Verifies that an applicant is not valid without a `last_name`.
    - Expected Result:
      - The applicant should not be valid.
      - The `last_name` field should have a validation error indicating that it can't be blank.
  - It should validate the presence of culture_type:
    - Description: Verifies that an applicant is not valid without a `culture_type`.
    - Expected Result:
      - The applicant should not be valid.
      - The `culture_type` field should have a validation error indicating that it can't be blank.

#### Attributes

- Description: Tests the attributes of the `Applicant` model.
- Test Case:
  - It should have valid attributes:
    - Description: Verifies that an applicant has the expected attributes.
    - Expected Result:
      - The applicant should be valid.
      - The `first_name`, `last_name`, and `culture_type` fields should have the expected values.

### Company Model Tests

#### Validations

- Description: Tests the validations of the `Company` model.
- Test Case:
  - It should validate the presence of name:
    - Description: Verifies that a company

 is not valid without a `name`.
    - Expected Result:
      - The company should not be valid.
      - The `name` field should have a validation error indicating that it can't be blank.

#### Attributes

- Description: Tests the attributes of the `Company` model.
- Test Case:
  - It should have valid attributes:
    - Description: Verifies that a company has the expected attributes.
    - Expected Result:
      - The company should be valid.
      - The `name` and `culture_type` fields should have the expected values.

### CultureType Model Tests

#### Validations

- Description: Tests the validations of the `CultureType` model.
- Test Case:
  - It should validate the presence of name:
    - Description: Verifies that a culture type is not valid without a `name`.
    - Expected Result:
      - The culture type should not be valid.
      - The `name` field should have a validation error indicating that it can't be blank.

#### Attributes

- Description: Tests the attributes of the `CultureType` model.
- Test Case:
  - It should have valid attributes:
    - Description: Verifies that a culture type has the expected attributes.
    - Expected Result:
      - The culture type should be valid.
      - The `name` field should have the expected value.



