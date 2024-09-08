# DadJokes API

This project is a simple RESTful API that serves dad jokes in multiple languages. The jokes are stored in JSON files and can be retrieved randomly.

## Features

- Retrieve a random dad joke in the specified language.
- Supports multiple languages: English (en), Portuguese (pt), Spanish (es), French (fr), and German (de).

## Endpoints

### Get a Random Joke

- **URL:** `/getjoke`
- **Method:** `GET`
- **Query Parameters:**
  - `lang` (optional): The language code for the jokes. Default is `en`.

#### Example Request

```
GET /getjoke?lang=en
```

#### Example Response

```json
{
  "id": 2,
  "joke": "What do you call cheese that isn't yours? Nacho cheese."
}
```

## Setup
1. Clone the repository:
```
git clone https://github.com/yourusername/DadJokes.git
cd DadJokes
```

2. Build the project:
```
mvn clean install
```

3. Run the application:
```
mvn spring-boot:run
```

## Project Structure
- JokeController.java: The main controller that handles the API requests.
- resources/jokes/: Directory containing the JSON files with jokes in different languages.
## Adding New Jokes
To add new jokes, simply update the corresponding JSON file in the resources/jokes/ directory. Ensure the file follows the same structure as the existing ones.

## Dependencies
- Spring Boot
- Jackson Databind
## License
This project is licensed under the Apache 2.0 License. See the LICENSE file for details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.
