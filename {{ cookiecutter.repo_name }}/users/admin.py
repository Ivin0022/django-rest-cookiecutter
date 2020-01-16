from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# local
from .models import User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    '''Admin View for User'''