openapi: 3.0.0
info:
  title: Applicants API
  version: 1.0.0
paths:
  /api/v1/applicants:
    post:
      summary: Create a new applicant
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/ApplicantInput'
      responses:
        '201':
          description: Created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Applicant'
        '422':
          description: Unprocessable Entity
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Errors'
    get:
      summary: Get all applicants
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Applicant'
  /api/v1/applicants/matched:
    get:
      summary: Get matched applicants by culture type
      parameters:
        - name: culture_type
          in: query
          required: true
          schema:
            type: string
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Applicant'
components:
  schemas:
    Applicant:
      type: object
      properties:
        id:
          type: integer
          format: int64
        first_name:
          type: string
        last_name:
          type: string
        culture_type:
          type: string
    ApplicantInput:
      type: object
      properties:
        first_name:
          type: string
        last_name:
          type: string
        culture_type:
          type: string
      required:
        - first_name
        - last_name
        - culture_type
    Errors:
      type: object
      properties:
        errors:
          type: array
          items:
            type: string


------------------------------------------

openapi: 3.0.0
info:
  title: Company API
  version: 1.0.0
paths:
  /api/v1/companies:
    post:
      summary: Create a new company
      description: Creates a new company in the system.
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CompanyInput'
      responses:
        '201':
          description: Company created successfully
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Company'
        '422':
          description: Unprocessable Entity - Invalid input data
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ApiError'
    get:
      summary: Get all companies
      description: Retrieves a list of all companies in the system.
      responses:
        '200':
          description: List of companies retrieved successfully
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Company'
components:
  schemas:
    Company:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
          example: Acme Corp
        culture_type:
          type: string
          example: technology
    CompanyInput:
      type: object
      properties:
        name:
          type: string
          example: Acme Corp
        culture_type:
          type: string
          example: technology
    ApiError:
      type: object
      properties:
        error:
          type: string

-----------------------------------------

openapi: 3.0.0
info:
  title: Culture Type API
  version: 1.0.0
paths:
  /api/v1/culture_types:
    post:
      summary: Create a new culture type
      description: Creates a new culture type in the system.
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CultureTypeInput'
      responses:
        '201':
          description: Culture type created successfully
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/CultureType'
        '422':
          description: Unprocessable Entity - Invalid input data
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ApiError'
    get:
      summary: Get all culture types
      description: Retrieves a list of all culture types in the system.
      responses:
        '200':
          description: List of culture types retrieved successfully
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/CultureType'
components:
  schemas:
    CultureType:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
          example: Technology
    CultureTypeInput:
      type: object
      properties:
        name:
          type: string
          example: Technology
    ApiError:
      type: object
      properties:
        error:
          type: string

