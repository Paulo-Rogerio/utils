# Runbook

## Scripts

```bash
sudo ln -svf $(pwd)/git-http-server.sh /usr/local/bin/git-http-server.sh
sudo ln -svf $(pwd)/git-http-server-cleanup.sh /usr/local/bin/git-http-server-cleanup.sh
```

## Service

```bash
sudo ln -svf $(pwd)/git-http-server.service /etc/systemd/system/git-http-server.service
```

## Init

```bash
sudo systemctl daemon-reload
```

## Manager

```bash
sudo systemctl start git-http-server
sudo systemctl status git-http-server
sudo systemctl stop git-http-server
```
