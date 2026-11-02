import unittest
from tool import compare
class TestDrift(unittest.TestCase):
    def test_status_is_ignored(self):
        obj={"kind":"Deployment","metadata":{"name":"api"},"spec":{"replicas":2}}
        self.assertEqual(compare(obj,{**obj,"status":{"readyReplicas":1}}),[])
    def test_only_field_paths_are_reported(self):
        a={"kind":"Deployment","metadata":{"name":"api"},"spec":{"password":"example-1"}}
        b={"kind":"Deployment","metadata":{"name":"api"},"spec":{"password":"example-2"}}
        self.assertEqual(compare(a,b)[0]["paths"],["spec.password"])
        self.assertNotIn("example-1",str(compare(a,b)))
