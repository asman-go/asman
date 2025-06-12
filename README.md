# Asman project

## Clone repo

Clone:

```
git clone --recurse-submodules git@github.com:asman-go/asman.git
```

or:

```
git clone git@github.com:asman-go/asman.git
git submodule update --init --recursive
```

Pull latest dependencies versions:

```
git submodule foreach 'git checkout main && git pull'
```

## Start local project

Add to `/etc/hosts`:

```
127.0.0.1       asman.internal
127.0.0.1       api.asman.internal
```

Run:

```
make l-deploy
```

Try:

- https://api.asman.internal:10443/api/public/healthcheck
- https://api.asman.internal:10443/api/public/celery
- https://asman.internal:10443/
