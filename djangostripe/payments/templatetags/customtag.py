from django import template
from django.contrib.auth.models import Group
import datetime

register = template.Library()


@register.filter(name="custom_date")
def custom_date(value, arg=None):
    timestamp = datetime.datetime.fromtimestamp(int(value))
    timestamp.strftime("%Y-%m-%d %H:%M:%S")
    return timestamp



@register.filter(name="split_zeros")
def custom_zero(value,arg=None):
	x=str(value)
	f=x.split('.')
	split_data=f[0]+" /-"
	return split_data