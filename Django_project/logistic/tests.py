from unittest import TestCase
from django.test import Client


class CiCd(TestCase):
    def test_run_server(self):
        client = Client()
        response = client.get('')
        reference = 'Stocks-Products API v1 final'
        self.assertEqual(response.status_code, 200)
        self.assertIn(reference, str(response.content))
