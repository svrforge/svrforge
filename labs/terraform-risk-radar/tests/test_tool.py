import unittest
from tool import scan
class TestTerraform(unittest.TestCase):
    def test_open_cidr(self):
        self.assertEqual(scan('cidr_blocks=["0.0.0.0/0"]')[0]["rule"],"WORLD_OPEN_CIDR")
    def test_literal_secret_is_redacted(self):
        findings=scan('password = "example-secret"')
        self.assertEqual(findings[0]["rule"],"LITERAL_CREDENTIAL")
        self.assertNotIn("example-secret",str(findings))
    def test_comment(self):
        self.assertEqual(scan('# password = "example-secret"'),[])
