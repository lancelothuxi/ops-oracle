# ops-oracle
ansible实现自动expdp备份、alert日志分析、日志清理、表空间和大对象监控。
可以配置crontab进行调用。
例如： 
  每天凌晨3点执行expdp备份，可以使用功能crontab进行配置：
  00 03 * * * /usr/bin/ansible-playbook /home/ansible/auto_ops/expdp_backup.yml -i /home/ansible/auto_ops/hosts
