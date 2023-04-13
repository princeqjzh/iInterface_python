import random
from unittest import TestCase

from flaky import flaky


@flaky(max_runs=5)
class SampleTest(TestCase):
    def test_flaky1(self):

        result = random.choice([True, False])
        print(f'test_flaky1: Test result is {result}')
        self.assertTrue(result)

    def test_flaky2(self):
        result = random.choice([True, False])
        print(f'test_flaky2: Test result is {result}')
        self.assertTrue(result)

    def test_flaky3(self):
        result = random.choice([True, False])
        print(f'test_flaky3: Test result is {result}')
        self.assertTrue(result)

    def test_flaky4(self):
        result = random.choice([True, False])
        print(f'test_flaky4: Test result is {result}')
        self.assertTrue(result)
