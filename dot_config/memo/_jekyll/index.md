---
layout: default
title: Home
---

## Categories

<ul>
{% for category in site.categories %}
  {% assign cat_name = category[0] %}
  <li>
    <a href="{{ '/category/' | append: cat_name | append: '/' | relative_url }}">
      {{ cat_name }}
    </a>
    ({{ category[1].size }})
  </li>
{% endfor %}
</ul>

## Tags

<ul>
{% for tag in site.tags %}
  {% assign tag_name = tag[0] %}
  <li>
    <a href="{{ '/tag/' | append: tag_name | append: '/' | relative_url }}">
      {{ tag_name }}
    </a>
    ({{ tag[1].size }})
  </li>
{% endfor %}
</ul>

## All posts

<ul>
{% for post in site.posts %}
  <li>
    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    — <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </li>
{% endfor %}
</ul>
