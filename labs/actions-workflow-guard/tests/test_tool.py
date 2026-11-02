import unittest
from tool import scan
class TestWorkflows(unittest.TestCase):
    def test_unpinned_action(self):
        self.assertIn("ACTION_NOT_SHA_PINNED",[x["rule"] for x in scan("- uses: actions/checkout@v4")])
    def test_pinned_action(self):
        self.assertEqual(scan("- uses: actions/checkout@"+"a"*40),[])
    def test_wide_permissions(self):
        self.assertIn("BROAD_WRITE_PERMISSIONS",[x["rule"] for x in scan("permissions: write-all")])
