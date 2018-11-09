# README

Rails application, that generates a decision tree based on its actions.

Acton format:
```json
    {
      "first_name": "Dmitriy",
      "last_name": "Ivanov",
      "language": "Russian"
    }
```

Decision tree example:
```json
    {
      "key": "last_name",
      "values": {
        "Petrov": {
          "key": "first_name",
          "values": {
            "Pyotr": [1]
          },
          "default": []
        },
        "Ivanov": {
          "key": "language",
          "values": {
            "Russian": {
              "key": "first_name",
              "values": {
                "Ivan": [2],
                "Dmitriy": [3]
              },
              "default": []
            }
          },
          "default": []
        }
      },
      "default": []
    }
```
