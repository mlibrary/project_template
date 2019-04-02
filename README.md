# Overview

The contents of this repository are meant to serve as a set of best practices for MLibrary
projects. It is a compilation of the best tools for common tasks, and the configuration necessary to accomplish those tasks in the cleanest way. While one could start a new
project by cloning this repository and making some changes, the intended use is as an example
and guide.

It applies to ruby projects both with and without rails. Some of the tooling is also useful
for non-ruby projects.

# Gems

LIT Developers maintain a list of recommended gems in
[Confluence](https://tools.lib.umich.edu/confluence/display/LD/Recommended+Gems).

# Tools

This section briefly describes the tools in use, but does not serve as a guide for any of them.

## [Github](https://github.com/)

We've standardized on using Github as the central host of our git repositories. The use of pull
requests is highly recommended, and the other tools are configured with this practice in mind.

## [Travis-CI](https://docs.travis-ci.com/)

We use travis-ci to ensure that every build is run through its test suite before being deployed.
Travis's integration with Github allows it to automatically build pull requests, and report
whether they succeed or fail right there on the pull request itself.  There is also a slack
integration for those teams that desire it, but we have not included it here.

Travis will work out of the box, but configuration options are in `.travis.yml`; consult
the official docs for more info on how to customize the builds.

## [Rubocop](https://rubocop.readthedocs.io/en/latest/)

Rubocop is a style linter. It is powerful and extremely configurable, and is capable of fixing
many issues automatically. A recommended rubocop configuration is included here
(as `.rubocop.yml`), but teams may modify their configuration as needed.

Upon first adding rubocop to a project, there will typically be a very large number of style
violations, such that it would be unreasonable to resolve all of them immediately. Rubocop has a
[solution](https://rubocop.readthedocs.io/en/latest/configuration/#automatically-generated-configuration)
for this in the form of a `.rubocop_todo.yml` file so that the issues can be addressed over time.

Rubocop can be invoked via `bin/rubocop`. This project is configured to run rubocop within
travis-ci, and mark builds with issues as broken builds. It can be tempting to disable this
feature, but the above-described `.rubocop_todo.yml` feature is the correct way to solve
this problem.

## [Coveralls](https://docs.coveralls.io/)

Coveralls is an external service that plugs into the SimpleCov gem to monitor your project's test
coverage. It integrates with Github to automatically analyze commits and pull requests, and will
report the improvement or regression in test coverage right in the pull request.

While high test coverage is great, 100% coverage tends to fail the pareto principle. However,
we recommend teams include a policy of not merging commits that lower the test coverage without
serious review.

## [RubyDoc.info](https://www.rubydoc.info/)

RubyDoc.info is an external host for javadoc-style documentation of your project's modules,
classes, and methods. It uses [yard](https://yardoc.org/) to build out the documentation
directly from your source code. It works minimally on ruby codebases out of the box, and
offers a comprehensive host of directives that can used in source code comments to further
improve the product.

RubyDoc.info updates automatically. You can compile and view the documentation locally
by running `bin/yard serve`, then viewing it in a browser.

## [ReadTheDocs](https://readthedocs.org/)

ReadTheDocs is a documentation host for those docs that are not specifically source code
annotations. Typically, this will include high-level descriptions, workflows, reasoning,
and those things that one usually finds in a README.

ReadTheDocs uses [sphinx](http://www.sphinx-doc.org/en/stable/) to build the documentation,
and will do so automatically. You can compile and view the documentation locally. Note
that this will require `python` to be installed; the version from your package manager is
sufficient.

### [PlantUML](https://build-me-the-docs-please.readthedocs.io/en/latest/Using_Sphinx/UsingGraphicsAndDiagramsInSphinx.html#using-plantuml) Graphs

As configured in this repository, both ReadTheDocs and the local sphinx instance can automatically
draw graphs from text using [PlantUML](http://plantuml.com/). Note that to build this locally,
the command `plantuml` needs to be on your path (you can change this command in `docs/conf.py`).


```
cd docs
pip install -r requirements.txt
make auto
# Then view it with a browser
```

# Badges

To include badges, copy the code below, adjusting the url as necessary. You'll need to view the
actual file rather than the rendered version. They provide useful links and status-at-a-glance.

* Travis - [![Build Status](https://travis-ci.org/mlibrary/moku.svg?branch=master)](https://travis-ci.org/mlibrary/moku?branch=master)
* RubyDoc.info - [![API Docs](https://img.shields.io/badge/API_docs-rubydoc.info-blue.svg)](https://www.rubydoc.info/github/mlibrary/moku)
* Coveralls - [![Coverage Status](https://coveralls.io/repos/github/mlibrary/moku/badge.svg?branch=master)](https://coveralls.io/github/mlibrary/moku?branch=master)
* ReadTheDocs - [![Documentation Status](https://readthedocs.org/projects/moku/badge/?version=latest)](https://moku.readthedocs.io/en/latest/?badge=latest)

# Setting Up Integrations

Once setup, all of the integrations stay up to date automatically. While it would be possible
to automate the setup of these integrations via their APIs, creating the API key for your
user account ends up being more work.

Only one user needs to peform these steps.

## Travis-CI

Head to [travis-ci.org] and link your Github account. Then check the box for your repository.
It can sometimes take a minute for travis to sync your account.

## Coveralls

Go to [coveralls.io], link your Github account, then add your repository to coveralls.

## RubyDoc.info

In the upper right corner of [rubydoc.info], there's a box to import. Add
`git://github.com/mlibrary/myproject.git` to the Github repository.

## ReadTheDocs

Head [here](https://readthedocs.org/dashboard/import/) and import your project. You'll need
to link your Github account.

