# Runbook

## Scripts

```bash
sudo ln -svf $(pwd)/git-http-server.sh /usr/local/bin/git-http-server.sh
sudo ln -svf $(pwd)/git-http-server-cleanup.sh /usr/local/bin/git-http-server-cleanup.sh
```

## Service

```bash
mkdir -p ~/.config/systemd/user
ln -svf $(pwd)/git-http-server.service ~/.config/systemd/user/git-http-server.service
```

## Init

```bash
systemctl --user daemon-reload
```

## Manager

```bash
systemctl --user start git-http-server
systemctl --user stop git-http-server
systemctl --user status git-http-server
```
