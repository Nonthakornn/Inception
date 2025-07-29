FROM python

WORKDIR /usr/src/app

COPY *.py .

RUN pip install --no-cache-dir flask

ENV USER=mypythonuser
ENV GROUP=mypythongroup

# -r crates(groupadd) a systm group with a GID below 1000 (They are consider as non-login group for system)
# -m creates a home directory for the user
# -r creates(useradd) a system user with a UID (User ID) below 1000
# -g sets the user's primary group to the specified group
RUN groupadd -r ${GROUP} && useradd -m -r -g ${GROUP} ${USER}

# chown sets who owns the files (user) and which group they belong to
# -R recusively
RUN chown -R ${USER}:${GROUP} /usr/src/app

USER ${USER}

CMD ["python", "app.py"]

EXPOSE 5000