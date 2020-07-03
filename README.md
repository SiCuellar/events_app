
# Events App (API)

Events App is a Rails API challenge given by CR. :hospital:  


Deployment URL: https://quiet-cove-11984.herokuapp.com/

![](https://media.giphy.com/media/RRerwvHrb0nxm/giphy.gif)

## Installation

Grab the source code and `cd` into the directory:

```bash
git clone https://git@github.com:SiCuellar/events_app.git
cd events_app
```

Then download all the dependencies and compile an executable:

```bash
bundle install bundle update
rake db:{drop,create,migrate,seed}

```

### API Endpoints

#### `POST /api/v1/events?name=<BUTTON_NAME>&event_type=<BUTTON_EVENT_TYPE>`

This endpoint will allow the user to post events with required name && Event_types with the option to add other event_attributes. Happy path will return a `200` status

Example Response:
```json

  {
    "status": 200,
    "message": "Successful Post"
  }

```
Sad path will return a `422` status

#### `GET /api/v1/events`
This endpoint will retrieve an event index for the database with a status of `200`

```json
{
    "status": 200,
    "message": "Loaded Events",
    "data":  [
        {
            "id": 1,
            "name": "test button",
            "created_at": "2020-07-02T19:44:51.626Z",
            "updated_at": "2020-07-02T19:44:51.626Z",
            "event_type": "click",
            "event_attributes": null
        },
        {
            "id": 2,
            "name": "button",
            "created_at": "2020-07-02T19:44:51.632Z",
            "updated_at": "2020-07-02T19:44:51.632Z",
            "event_type": "no-click",
            "event_attributes": {
                "button_color": "red"
            }
        },
        {
            "id": 3,
            "name": "scroll",
            "created_at": "2020-07-02T19:44:51.636Z",
            "updated_at": "2020-07-02T19:44:51.636Z",
            "event_type": "somwthing",
            "event_attributes": {
                "at": "2020-06-12T00:00:01"
            }
        }
    ]
}
```


#### `GET api/v1/events?date=today`
This endpoint will return a JSON response containing data grouped by event_type and count for that particular day. A successful match will return:

```json
{
    "status": 200,
    "message": "Today's Stats",
    "data": [
        {
            "id": null,
            "event_type": "click",
            "count": 4
        },
        {
            "id": null,
            "event_type": "no-click",
            "count": 1
        }
    ]
}
```
## Testing
Development: The App is fully Testing using Rspec

Produciton: run the following Curl command
```
curl -X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "test button", "event_type" : "click", "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' 'https://quiet-cove-11984.herokuapp.com/events'

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Just kidding! I would like to hear any feedback that you have for me.

![](https://media.giphy.com/media/NEvPzZ8bd1V4Y/giphy.gif)
Ready to give it my all!
