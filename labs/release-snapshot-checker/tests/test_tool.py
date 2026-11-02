import unittest
from tool import inspect
class TestReleases(unittest.TestCase):
    def test_no_deployment(self):
        self.assertEqual(inspect({"kind": "Service"}), [])
    def test_detect_replicas(self):
        d = {"kind":"Deployment","spec":{"replicas":1,"template":{"spec":{"containers":[]}}}}
        self.assertEqual(inspect(d)[0]["rule"],"LOW_REPLICAS")
