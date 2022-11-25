from api import app # Flask instance of the API

def test_status_page():
    response = app.test_client().get('/status')

    assert response.status_code == 200
    assert b"<h1>STATUS</h1>" in response.data