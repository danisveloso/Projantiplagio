# Generated by Django 3.0.5 on 2020-08-17 15:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cadastro', '0002_auto_20200816_1423'),
    ]

    operations = [
        migrations.AddField(
            model_name='turma',
            name='campus',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='cadastro.Campus', verbose_name='Campus'),
        ),
    ]
