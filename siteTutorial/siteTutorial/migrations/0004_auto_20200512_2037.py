# Generated by Django 3.0.5 on 2020-05-12 23:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('siteTutorial', '0003_auto_20200512_2033'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contato',
            name='email',
            field=models.EmailField(max_length=254),
        ),
        migrations.AlterField(
            model_name='contato',
            name='mensagem',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='contato',
            name='nome',
            field=models.CharField(max_length=100),
        ),
    ]
