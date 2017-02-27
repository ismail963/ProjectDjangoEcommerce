from django import forms

class updateAccountForm(forms.Form):
	firstname = forms.CharField(max_length=100)
	lastname = forms.CharField(max_length=100)
	email = forms.EmailField()

class contactUsForm(forms.Form):
	objet= forms.CharField(max_length=255)
	message= forms.CharField(widget=forms.Textarea)