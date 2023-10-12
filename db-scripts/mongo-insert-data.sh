bash <<'EOF'
N=1000
NAMES=("Alice" "Bob" "Charlie" "David" "Eva" "Frank" "Grace" "Hannah" "Ian" "Julia")
ADDRESSES=("123 Main St" "456 Maple Ave" "789 Birch Rd" "101 Elm St" "202 Oak Ln" "303 Pine Dr" "404 Cedar Way" "505 Redwood Blvd")

mongosh <<EOC
use myDatabase

$(for ((i=1; i<=N; i++)); do
  RANDOM_NAME=${NAMES[$RANDOM % ${#NAMES[@]}]}
  RANDOM_AGE=$((RANDOM % 82 + 18))
  RANDOM_ADDRESS=${ADDRESSES[$RANDOM % ${#ADDRESSES[@]}]}
  echo "db.myCollection.insert({ name: '$RANDOM_NAME', age: $RANDOM_AGE, address: '$RANDOM_ADDRESS' });"
done)
EOC

echo "Inserted $N random documents into MongoDB!"
EOF
