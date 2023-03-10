from django.test import Client

def test_status(client:Client):
    resp = client.get('/')
    assert resp.status_code == 200