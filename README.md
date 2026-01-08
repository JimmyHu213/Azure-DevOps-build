## Quick Start

### Prerequisites
- Azure Subscription
- Azure CLI installed
- Python 3.11+
- Git
- Azure DevOps account (for CI/CD)

### Local Setup

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/azure-etl-portfolio.git
cd azure-etl-portfolio
```

2. **Install Python dependencies**
```bash
pip install -r requirements.txt
```

3. **Run tests locally**
```bash
cd src/etl
python -m pytest test_processor.py -v
```

4. **Test ETL processor**
```bash
python data_processor.py
```

### Azure Deployment

See [Deployment Guide](./docs/deployment-guide.md) for detailed instructions.

---

## 💡 Key Implementation Details

### Incremental Loading Pattern
The watermark-based incremental loading pattern efficiently processes only changed data:

1. **Lookup Old Watermark** - Retrieve last processed timestamp
2. **Lookup New Watermark** - Get latest timestamp from source
3. **Copy Delta** - Extract records between watermarks
4. **Update Watermark** - Store new watermark for next run

**Benefits:**
- Reduced processing time
- Lower costs
- Scalable for large datasets

### Parameterization Strategy
All pipelines use parameters for maximum reusability:
- Source/sink schema and table names
- File paths and names
- Watermark columns
- Environment-specific configurations

### Security Best Practices
- All credentials stored in Azure Key Vault
- Managed identities for service authentication
- No hardcoded secrets in code
- RBAC for resource access

---


Now check if it's there:
bashls -la README.md
Let me know if you can see it now!Claude is AI and can make mistakes. Please double-check responses. Sonnet 4.5
