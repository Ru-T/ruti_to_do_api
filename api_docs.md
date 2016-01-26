GET: /to_dos

Params:
{}
Response:
{"to_dos":[]}
POST: /to_dos

Params:
{"to_do"=>{"title"=>"New title", "is_completed"=>true}}
Response:
{"to_do":{"id":1,"title":"New title","is_completed":true}}
PUT: /to_dos/1

Params:
{"to_do"=>{"title"=>"Brand new title", "is_completed"=>false}, "id"=>"1"}
Response:
{"to_do":{"id":1,"title":"Brand new title","is_completed":false}}
DELETE: /to_dos/1

Params:
{"id"=>"1"}
Response:
{}
