log_file=/tmp/logfile

download_and_extract () {
  echo Download and Extract $component code
  curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip &>>$log_file
  unzip /tmp/$component.zip &>>$log_file
}

status_check () {
    if [ $? -eq 0 ]; then
      echo -e "\e[32SUCCESS\e[0m"
    else
      echo -e "\e[31FAILURE\e[0m"
      exit 1
  fi
}
