FROM python:3.12.1 as dependencies

RUN apt install -y curl

# Copy just the requirements.txt initially to leverage Docker cache
COPY requirements.txt .

# Install dependencies to the local user directory (e.g., .local)
RUN pip install --user -r requirements.txt

# on récupère depuis Dockerhub une image de base de Python
# IMAGE:TAG => le tag est l'identifiant unique de la version de l'image
FROM python:3.12.1

COPY --from=dependencies /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

# docker build -t watch .
