#!/bin/bash

TMP_DIR="tmp" # You may need to change this for your local testing.

# 1. Create Directory Structure
# Create the main 'project' directory and its subdirectories: 'data', 'scripts', 'logs', and 'backup'.
echo "Creating directory structure..."
# YOUR CODE HERE
mkdir -p project/data project/scripts project/logs project/backup

# 2. File Operations
# In the 'data' directory, create five text files and add some sample content to each.
echo "Creating files in the 'data' directory..."
# YOUR CODE HERE
for i in {1..5}; do
    echo "This is file $i" > project/data/file$i.txt
done

# Copy 'file1.txt' to the 'backup' directory.
echo "Copying 'file1.txt' to 'backup' directory..."
# YOUR CODE HERE
cp project/data/file1.txt project/backup/

# Rename 'file3.txt' to 'file3_renamed.txt'.
echo "Renaming 'file3.txt' to 'file3_renamed.txt'..."
# YOUR CODE HERE
mv project/data/file3.txt project/data/file3_renamed.txt

# Move 'file4.txt' and 'file5.txt' to the 'logs' directory. Force the move to avoid prompts.
echo "Moving 'file4.txt' and 'file5.txt' to 'logs' directory..."
# YOUR CODE HERE
mv -f project/data/file4.txt project/data/file5.txt project/logs/

# Delete 'file2.txt' from the 'data' directory.
echo "Deleting 'file2.txt' from 'data' directory..."
# YOUR CODE HERE
rm project/data/file2.txt

# 3. Directory Management
# List all files and directories within the 'project' directory with detailed information.
echo "Listing all files and directories with detailed information..."
# YOUR CODE HERE
ls -l project/

# Display the total size of the 'data' and 'logs' directories.
echo "Displaying total size of 'data' and 'logs' directories..."
# YOUR CODE HERE
du -sh project/data project/logs

# Identify and display the 10 largest files and directories within the 'project' directory.
echo "Displaying the 10 largest files and directories in 'project'..."
# YOUR CODE HERE
du -ah project/ | sort -rh | head -10

# 4. File Permissions and Ownership
# Set specific file permissions 644 for 'file1.txt' in the 'backup' directory.
echo "Setting file permissions 644 for 'file1.txt'..."
# YOUR CODE HERE
chmod 664 project/backup/file1.txt

# Set specific file permissions 644 for 'file3_renamed.txt' in the 'data' directory.
echo "Setting file permissions 644 for 'file3_renamed.txt'..."
# YOUR CODE HERE
chmod 644 project/data/file3_renamed.txt

# Change the ownership of 'file4.txt' in the 'logs' directory to another user and group (nobody:nogroup).
echo "Changing ownership of 'file4.txt'..."
# YOUR CODE HERE
chown nobody:nogroup project/logs/file4.txt

# 5. Symbolic Links
# Create a symbolic link in the 'scripts' directory pointing to 'backup/file1.txt' in the 'backup' directory.
echo "Creating symbolic link 'file1_link.txt' in 'scripts' directory..."
# YOUR CODE HERE
ln -s ../backup/file1.txt project/scripts/file1_link.txt

# Manually verify that (use ls) the symbolic link has been created and points to the correct target.
echo "Verifying the symbolic link of file1.txt..."
# YOUR CODE HERE
ls -l project/scripts/file1_link.txt

# 6. System Monitoring and Process Management
# Display the disk usage of the entire filesystem.
echo "Displaying disk usage of the filesystem..."
# YOUR CODE HERE
df -h

# List all running processes and specifically identify the process IDs related to Bash.
echo "Listing all running processes and finding PID of 'bash'..."
# YOUR CODE HERE
ps aux | grep bash

# 7. Automated Backup
# Create a compressed archive of the 'backup' directory and store it within the same directory.
# Use the current date to name the archive file.
echo "Creating a compressed archive of the 'backup' directory..."
# YOUR CODE HERE
tar -czf project/backup/backup_$(date +%Y%m%d).tar.gz -C project/ backup/

# 9. Log Completion
# Create a log message indicating the completion of the assignment tasks and store it in a 'README.md' file inside the 'project' directory.
echo "Logging completion message..."
# YOUR CODE HERE
echo "Assignment tasks completed successfully on $(date)" > project/README.md

# 10. Directory Existence Verification
# Add a verification step at the end of the script to check if the 'data' directory exists. If it doesn’t, the script should log an error message and exit.
# YOUR CODE HERE
if [ ! -d "project/data" ]; then
    echo "Error: 'data' directory does not exist!"
    exit 1
fi
