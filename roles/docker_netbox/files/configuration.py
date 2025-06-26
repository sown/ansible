from os import environ

# python-social-auth configuration
SOCIAL_AUTH_OIDC_ENDPOINT = environ.get('SOCIAL_AUTH_OIDC_ENDPOINT')
SOCIAL_AUTH_OIDC_KEY = environ.get('SOCIAL_AUTH_OIDC_KEY')
SOCIAL_AUTH_OIDC_SECRET = environ.get('SOCIAL_AUTH_OIDC_SECRET')
SOCIAL_AUTH_OIDC_SCOPE = ["openid", "profile", "email", "roles"]
LOGOUT_REDIRECT_URL = environ.get('LOGOUT_REDIRECT_URL')
