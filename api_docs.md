
## GET /to_dos

| Param | Value |


Response: 200

{
  "to_dos": [
    {
      "id": 1,
      "title": "I have to do this thang",
      "is_completed": true
    }
  ]
}

## POST /to_dos

| Param | Value |
| to_do | {"title"=>"New title", "is_completed"=>true} |

Response: 200

{
  "to_do": {
    "id": 2,
    "title": "New title",
    "is_completed": true
  }
}

## PUT /to_dos/1

| Param | Value |
| to_do | {"title"=>"Brand new title", "is_completed"=>false} |
| id | 1 |

Response: 200

{
  "to_do": {
    "id": 1,
    "title": "Brand new title",
    "is_completed": false
  }
}

## DELETE /to_dos/1

| Param | Value |
| id | 1 |

Response: 200

{
}
