Text("\(employee.name)")
                    .font(.title)
                GeometryReader { geometry in
                    if let imageURL = employee.largePhotoURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                maxWidth: geometry.size.width,
                                maxHeight: geometry.size.height
                            )
                    }
                }
                Spacer()