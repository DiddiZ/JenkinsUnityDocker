FROM jenkins

# alter this when you need to bump the Unity version. Pick a version from
# http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/
# and copy this file to an appropriately named directory 

USER root

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
	apt-get update && apt-get install -y \
      gconf-service \
      lib32gcc1 \
      lib32stdc++6 \
      libasound2 \
      libc6 \
      libc6-i386 \
      libcairo2 \
      libcap2 \
      libcups2 \
      libdbus-1-3 \
      libexpat1 \
      libfontconfig1 \
      libfreetype6 \
      libgcc1 \
      libgconf-2-4 \
      libgdk-pixbuf2.0-0 \
      libgl1-mesa-glx \
      libglib2.0-0 \
      libglu1-mesa \
      libgtk2.0-0 \
      libnspr4 \
      libnss3 \
      libpango1.0-0 \
      libstdc++6 \
      libx11-6 \
      libxcomposite1 \
      libxcursor1 \
      libxdamage1 \
      libxext6 \
      libxfixes3 \
      libxi6 \
      libxrandr2 \
      libxrender1 \
      libxtst6 \
      zlib1g \
      debconf \
      npm \
      xdg-utils \
      lsb-release \
      libpq5 \
      xvfb \
      git-lfs && \
	git lfs install

ADD http://beta.unity3d.com/download/8bc04e1c171e/unity-editor_amd64-5.6.0xf3Linux.deb .
RUN dpkg -i unity-editor_amd64-5.6.0xf3Linux.deb && rm unity-editor_amd64-5.6.0xf3Linux.deb

USER jenkins
