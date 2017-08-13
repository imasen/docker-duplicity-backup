export PASSPHRASE=$PASS
export AWS_ACCESS_KEY_ID=$KEY_ID
export AWS_SECRET_ACCESS_KEY=$ACCESS_KEY

excludes="$EXCLUDES"
backupsrc="$BACKUPSRC"
backupdest="s3+http://$BUCKET"
options="$OPTIONS"
removeolderthan="$REMOVE_OLDER_THAN"

echo "--- 	  starting backup		   ---"
	duplicity $options $excludes $backupsrc $backupdest
echo "--- 	    backup ended		   ---"

echo "--- 	  removing old backups		   ---"
	duplicity remove-older-than  --force $backupdest
echo "--- 	    removing old backups ended     ---"

export PASSPHRASE=
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
