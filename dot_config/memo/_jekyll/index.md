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

## Files

<ul>
{% for file in site.static_files %}
  {% assign segments = file.path | split: '/' %}
  {% if segments.size == 2 %}
    <li>
      <a href="{{ file.path | relative_url }}">{{ file.name }}</a>
    </li>
  {% endif %}
{% endfor %}

{% for page in site.pages %}
  {% assign page_segments = page.path | split: '/' %}
  {% if page_segments.size == 1 and page.path != "index.md" %}
    <li>
      <a href="{{ page.url | relative_url }}">{{ page.title | default: page.path }}</a>
    </li>
  {% endif %}
{% endfor %}
</ul>

## All posts

<ul>
{% for post in site.posts %}
  <li>
    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    — <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    <p>{{ post.content | strip_html | strip_newlines | truncate: 80 }}</p>
  </li>
{% endfor %}
</ul>
