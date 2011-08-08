{% import "manage/macros.tpl" as macros %}

{% extends "manage/wrapper.tpl" %}

{% block heading %}{% trans "FAQ Management" %}{% endblock %}

{% block managecontent %}

<form action="{{ base_url }}app=core&amp;module=site&amp;section=front&amp;do=faq&amp;action=post" method="post">
  {{ macros.manageform("faq_post", "Add FAQ Entry", true,
                       { 'Heading' : { 'id' : 'subject', 'type' : 'text', 'desc' : "Can not be left blank",  'value' : entry.entry_subject } ,
                         'Post'    : { 'id' : 'message', 'type' : 'textarea', 'value' : entry.entry_message } ,
                         'Order'   : { 'id' : 'order', 'type' : 'text', 'desc' : "Can be left blank, however it will appear at the top of the list",  'value' : entry.entry_order } }
                       ) 
  }}
<input type="hidden" id="edit" name="edit" value="{{ entry.entry_id }}" />
<input type="hidden" id="type" name="type" value="1" />
</form>
  
<br />  
<table class="users" cellspacing="1px">
  <col class="col1" /> <col class="col2" />
  <col class="col1" /> <col class="col2" />
  <thead>
    <tr>
      <th>{% trans "Order" %}</th>
      <th>{% trans "Heading" %}</th>
      <th>{% trans "Message" %}</th>
      <th>&nbsp;</th>
    </tr>
  </thead>
  <tbody>
  {% for faq in entries %}
    <tr>
      <td>{{ faq.entry_order }}</td>
      <td>{{ faq.entry_subject }}</td>
      <td>{{ faq.entry_message }}</td>
      <td>[ <a href="{{ base_url }}app=core&amp;module=site&amp;section=front&amp;do=faq&amp;action=edit&amp;id={{ faq.entry_id }}">{% trans "Edit" %}</a> ] [ <a href="{{ base_url }}app=core&amp;module=site&amp;section=front&amp;do=faq&amp;action=del&amp;id={{ faq.entry_id }}">{% trans "Delete" %}</a> ]</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
{% endblock %}