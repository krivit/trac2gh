% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gh_issue_formatters.R
\name{gh_issue_body}
\alias{gh_issue_body}
\alias{gh_issue_formatters}
\alias{gh_issue_labels}
\alias{gh_issue_milestone}
\alias{gh_issue_title}
\alias{trac_link_ticket}
\title{GitHub issue formatters}
\usage{
gh_issue_body(id, description, reporter, owner, time, changetime, type,
  priority, keywords)

gh_issue_title(id, summary)

gh_issue_milestone(number)

gh_issue_labels(type, priority)

trac_link_ticket(id, base_url = getOption("trac2gh.base_url"))
}
\arguments{
\item{id, description, reporter, owner, time, changetime, keywords}{character Trac ticket metadata}

\item{type, priority}{character, Trac ticket type and priority}

\item{summary}{character, Trac ticket summary (aka title)}

\item{number}{GH issue number}

\item{base_url}{character, base URL to Trac instance}
}
\value{
\code{gh_issue_body} returns a character vector with issue body in Markdown.

\code{gh_issue_title} returns a formatted issue title composed of original ticket
summary and id.

\code{gh_issue_labels} returns a list of labels for every ticket.

\code{trac_link_ticket} returns a vector of URLs.
}
\description{
Functions formatting GitHub issue data. They are vectorized so multiple
tickets can be processed.
}
\details{
Function \code{gh_issue_body} creates the GH issue body based on Trac ticket 
description and other metadata. The text is transformed from MoinMoin wiki 
markup to Markdown using a rather rudimentary parser 
\code{\link{moinmoin_to_markdown}}. The body is prepended with a "header"
containing original metadata from Trac.

\code{gh_issue_title} creates issue title from Trac ticket summary prepending
Trac ticket id in square brackets.

\code{gh_issue_labels} creates labels based on Trac ticket priority and type.
Label names are have a format \code{p:foo} and \code{t:bar} for tickets
of priority "foo" and type "bar".

\code{trac_link_ticket} creates URL to a ticket on Trac.
}

