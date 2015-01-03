gc_type=`/home/seiya/.rbenv/shims/ruby /home/seiya/projects/gabAlert/today.rb`
nil_msg='ごみ回収はない'

if test "${gc_type}" != "${nil_msg}"
then
  date=`date`
  message="今日のゴミ回収は${gc_type}です。"

  echo "${date}${message}" | /usr/bin/mail -s "$gc_type" "omprand.serbei@gmail.com"
fi

