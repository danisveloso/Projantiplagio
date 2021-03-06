# Generated by Django 3.0.5 on 2020-05-12 23:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('siteTutorial', '0002_contato_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contato',
            name='email',
            field=models.EmailField(blank=True, max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='contato',
            name='mensagem',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='contato',
            name='nome',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
