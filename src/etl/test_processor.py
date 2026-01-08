"""
Unit tests for DataProcessor
"""

import unittest
import pandas as pd
import os
from etl.data_processor import DataProcessor


class TestDataProcessor(unittest.TestCase):

    def setUp(self):
        self.processor = DataProcessor(environment="test")
        self.test_data = pd.DataFrame(
            {"order_id": [1, 2, 3], "amount": [100, 200, 300], "quantity": [1, 2, 3]}
        )

    def test_initialization(self):
        """Test processor initialization"""
        self.assertEqual(self.processor.environment, "test")

    def test_transform_adds_metadata(self):
        """Test transformation adds required columns"""
        result = self.processor.transform_data(self.test_data.copy())
        self.assertIn("processed_date", result.columns)
        self.assertIn("environment", result.columns)

    def test_transform_removes_duplicates(self):
        """Test duplicate removal"""
        df_with_dupes = pd.concat([self.test_data, self.test_data.iloc[[0]]])
        result = self.processor.transform_data(df_with_dupes)
        self.assertEqual(len(result), len(self.test_data))


if __name__ == "__main__":
    unittest.main()
