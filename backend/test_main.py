import unittest

from backend.main import config, health


class AppTestCase(unittest.TestCase):
    def test_health_endpoint_response(self):
        self.assertEqual(health(), {"status": "ok"})

    def test_config_endpoint_contains_database_keys(self):
        response = config()

        self.assertIn("database_configured", response)
        self.assertIn("database_host", response)
        self.assertIn("secret_key_configured", response)
        self.assertEqual(response["database_host"], "database")


if __name__ == "__main__":
    unittest.main()
