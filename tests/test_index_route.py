from api import app # Flask instance of the API

def test_index_route():
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert b"<h1>Hello and Welcome dear friend!</h1>" in response.data