from django.contrib import admin

# 3rd party

# local
from .models import User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    '''Admin View for User'''