from django import forms

class signUpForm(forms.Form):
    firstname = forms.CharField(max_length=100)
    lastname = forms.CharField(max_length=100)
    email = forms.EmailField()
    username= forms.CharField(max_length=100)
    password= forms.CharField(widget=forms.PasswordInput)

class cnxForm(forms.Form):
    username= forms.CharField(max_length=100)
    password= forms.CharField(widget=forms.PasswordInput)