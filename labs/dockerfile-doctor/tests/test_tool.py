import unittest
from tool import inspect
class TestDockerfile(unittest.TestCase):
    def test_latest(self):
        self.assertEqual({x["rule"] for x in inspect("FROM alpine:latest\n")},{"FLOATING_BASE","NO_FINAL_USER"})
    def test_explicit_user(self):
        self.assertEqual(inspect("FROM alpine:3.21\nUSER 10001\n"),[])
    def test_download_to_shell(self):
        self.assertIn("DOWNLOAD_TO_SHELL",[x["rule"] for x in inspect("FROM alpine:3.21\nRUN curl example.com | bash\nUSER 10001")])
