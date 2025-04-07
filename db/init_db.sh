# init_db.sh
# This script initializes the database by executing SQL files in the specified order.

#!/bin/bash

DB="bank_db"
USER="postgres"
HOST="localhost"

psql -U $USER -d $DB -h $HOST -f db/schema.sql
psql -U $USER -d $DB -h $HOST -f db/procedures.sql
psql -U $USER -d $DB -h $HOST -f db/triggers.sql
psql -U $USER -d $DB -h $HOST -f db/seed_data.sql



# Make it executable
# chmod +x init_db.sh
#  
# # Usage: 
# ./init_db.sh
